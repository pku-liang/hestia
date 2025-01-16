/*===============================================================*/
/*                                                               */
/*                      optical_flow.cpp                         */
/*                                                               */
/*             Hardware function for optical flow                */
/*                                                               */
/*===============================================================*/

#include "buffer_c.h"

namespace hls
{
	template <typename T, int depth>
	struct stream
	{
		T read();
		void write(T data);
	};
}

// define these constants so they can be used in pragma
const int max_width = MAX_WIDTH;
const int default_depth = MAX_WIDTH;
// calculate gradient in x and y directions
void gradient_xy_calc(hls::stream<input_t, default_depth> &frame,
					  hls::stream<pixel_t, default_depth> &gradient_x,
					  hls::stream<pixel_t, default_depth> &gradient_y)
{
	// our own line buffer
	pixel_t buf[5][MAX_WIDTH];
#pragma HLS array_partition variable = buf complete dim = 1

	// small buffer
	pixel_t smallbuf[5];
#pragma HLS array_partition variable = smallbuf complete dim = 0

	// window buffer
	input_t window[5][5];
#pragma HLS array_partition variable = window complete dim = 0
#pragma HLS array_partition variable = window complete dim = 1

	const int GRAD_WEIGHTS[] = {1, -8, 0, 8, -1};

GRAD_XY_OUTER:
	for (int r = 0; r < MAX_HEIGHT + 2; r++)
	{
	GRAD_XY_INNER:
		for (int c = 0; c < MAX_WIDTH + 2; c++)
		{
#pragma HLS pipeline II = 1
			// read out values from current line buffer
			for (int i = 0; i < 4; i++)
#pragma HLS unroll
				smallbuf[i] = buf[i + 1][c];
			// the new value is either 0 or read from frame
			if (r < MAX_HEIGHT && c < MAX_WIDTH)
				smallbuf[4] = (pixel_t)(frame.read());
			else if (c < MAX_WIDTH)
				smallbuf[4] = 0;
			// update line buffer
			if (r < MAX_HEIGHT && c < MAX_WIDTH)
			{
				for (int i = 0; i < 4; i++)
#pragma HLS unroll
					buf[i][c] = smallbuf[i];
				buf[4][c] = smallbuf[4];
			}
			else if (c < MAX_WIDTH)
			{
				for (int i = 0; i < 4; i++)
#pragma HLS unroll
					buf[i][c] = smallbuf[i];
				buf[4][c] = smallbuf[4];
			}

			// manage window buffer
			if (r < MAX_HEIGHT && c < MAX_WIDTH)
			{
				shift_pixels_left_5_5(window);
				for (int i = 0; i < 5; i++)
#pragma HLS unroll
					insert_pixel_5_5(window, smallbuf[i], i, 4);
			}
			else
			{
				shift_pixels_left_5_5(window);
				insert_pixel_5_5(window, 0, 0, 4);
				insert_pixel_5_5(window, 0, 1, 4);
				insert_pixel_5_5(window, 0, 2, 4);
				insert_pixel_5_5(window, 0, 3, 4);
				insert_pixel_5_5(window, 0, 4, 4);
			}

			// compute gradient
			pixel_t x_grad = 0;
			pixel_t y_grad = 0;
			if (r >= 4 && r < MAX_HEIGHT && c >= 4 && c < MAX_WIDTH)
			{
			GRAD_XY_XYGRAD:
				for (int i = 0; i < 5; i++)
				{
#pragma HLS unroll
					x_grad += window[2][i] * GRAD_WEIGHTS[i];
					y_grad += window[i][2] * GRAD_WEIGHTS[i];
				}
				gradient_x.write(x_grad / 12);
				gradient_y.write(y_grad / 12);
			}
			else if (r >= 2 && c >= 2)
			{
				gradient_x.write(0);
				gradient_y.write(0);
			}
		}
	}
}

// calculate gradient in the z direction
void gradient_z_calc(hls::stream<input_t, default_depth> &frame1,
					 hls::stream<input_t, default_depth> &frame2,
					 hls::stream<input_t, default_depth> &frame3,
					 hls::stream<input_t, default_depth> &frame4,
					 hls::stream<input_t, default_depth> &frame5,
					 hls::stream<pixel_t, max_width * 4> &gradient_z)
{
	const int GRAD_WEIGHTS[] = {1, -8, 0, 8, -1};
GRAD_Z_OUTER:
	for (int r = 0; r < MAX_HEIGHT; r++)
	{
	GRAD_Z_INNER:
		for (int c = 0; c < MAX_WIDTH; c++)
		{
#pragma HLS pipeline II = 1
			gradient_z.write(((pixel_t)(frame1.read() * GRAD_WEIGHTS[0] + frame2.read() * GRAD_WEIGHTS[1] + frame3.read() * GRAD_WEIGHTS[2] + frame4.read() * GRAD_WEIGHTS[3] + frame5.read() * GRAD_WEIGHTS[4])) / 12);
		}
	}
}

// average the gradient in y direction
void gradient_weight_y(hls::stream<pixel_t, default_depth> &gradient_x,
					   hls::stream<pixel_t, default_depth> &gradient_y,
					   hls::stream<pixel_t, max_width * 4> &gradient_z,
					   hls::stream<pixel_t, default_depth> &filt_grad_x,
					   hls::stream<pixel_t, default_depth> &filt_grad_y,
					   hls::stream<pixel_t, default_depth> &filt_grad_z)
{
	pixel_t buf[7][MAX_WIDTH][3];
#pragma HLS array_partition variable = buf dim = 1 complete

	const pixel_t GRAD_FILTER[] = {0.0755, 0.133, 0.1869, 0.2903, 0.1869, 0.133, 0.0755};
GRAD_WEIGHT_Y_OUTER:
	for (int r = 0; r < MAX_HEIGHT + 3; r++)
	{
	GRAD_WEIGHT_Y_INNER:
		for (int c = 0; c < MAX_WIDTH; c++)
		{
#pragma HLS pipeline II = 1
			// #pragma HLS dependence variable = buf inter false

			if (r < MAX_HEIGHT)
			{
				shift_pixels_up_7_MAX_WIDTH_3(buf, c);
				pixel_t tmp[3];
				tmp[0] = gradient_x.read();
				tmp[1] = gradient_y.read();
				tmp[2] = gradient_z.read();
				insert_bottom_row_7_MAX_WIDTH_3(buf, tmp, c);
			}
			else
			{
				shift_pixels_up_7_MAX_WIDTH_3(buf, c);
				pixel_t tmp[3];
				tmp[0] = gradient_x.read();
				tmp[1] = gradient_y.read();
				tmp[2] = gradient_z.read();
				insert_bottom_row_7_MAX_WIDTH_3(buf, tmp, c);
			}

			pixel_t acc[3];
			acc[0] = 0;
			acc[1] = 0;
			acc[2] = 0;

			if (r >= 6 && r < MAX_HEIGHT)
			{
			GRAD_WEIGHT_Y_ACC:
				for (int i = 0; i < 7; i++)
				{
#pragma HLS unroll
					acc[0] += buf[i][c][0] * GRAD_FILTER[i];
					acc[1] += buf[i][c][1] * GRAD_FILTER[i];
					acc[2] += buf[i][c][2] * GRAD_FILTER[i];
				}
				filt_grad_x.write(acc[0]);
				filt_grad_y.write(acc[0]);
				filt_grad_z.write(acc[0]);
			}
			else if (r >= 3)
			{
				filt_grad_x.write(acc[0]);
				filt_grad_y.write(acc[0]);
				filt_grad_z.write(acc[0]);
			}
		}
	}
}

// average gradient in the x direction
void gradient_weight_x(hls::stream<pixel_t, default_depth> &y_filt_x,
					   hls::stream<pixel_t, default_depth> &y_filt_z,
					   hls::stream<pixel_t, default_depth> &y_filt_y,
					   hls::stream<pixel_t, default_depth> &filt_grad_x,
					   hls::stream<pixel_t, default_depth> &filt_grad_y,
					   hls::stream<pixel_t, default_depth> &filt_grad_z)
{
	pixel_t buf[1][7][3];
	const pixel_t GRAD_FILTER[] = {0.0755, 0.133, 0.1869, 0.2903, 0.1869, 0.133, 0.0755};
GRAD_WEIGHT_X_OUTER:
	for (int r = 0; r < MAX_HEIGHT; r++)
	{
	GRAD_WEIGHT_X_INNER:
		for (int c = 0; c < MAX_WIDTH + 3; c++)
		{
#pragma HLS pipeline II = 1
			shift_pixels_left_1_7_3(buf);
			pixel_t tmp[3];
			if (c < MAX_WIDTH)
			{
				tmp[0] = y_filt_x.read();
				tmp[1] = y_filt_y.read();
				tmp[2] = y_filt_z.read();
			}
			else
			{
				tmp[0] = 0;
				tmp[1] = 1;
				tmp[2] = 2;
			}
			insert_pixel_1_7_3(buf, tmp, 0, 6);
			pixel_t acc[3];
			acc[0] = 0;
			acc[1] = 0;
			acc[2] = 0;
			if (c >= 6 && c < MAX_WIDTH)
			{
			GRAD_WEIGHT_X_ACC:
				for (int i = 0; i < 7; i++)
				{
#pragma HLS unroll
					acc[0] += buf[0][i][0] * GRAD_FILTER[i];
					acc[1] += buf[0][i][1] * GRAD_FILTER[i];
					acc[2] += buf[0][i][2] * GRAD_FILTER[i];
				}
				filt_grad_x.write(acc[0]);
				filt_grad_y.write(acc[0]);
				filt_grad_z.write(acc[0]);
			}
			else if (c >= 3)
			{
				filt_grad_x.write(acc[0]);
				filt_grad_y.write(acc[0]);
				filt_grad_z.write(acc[0]);
			}
		}
	}
}

// outer product
void outer_product(hls::stream<pixel_t, default_depth> &gradient_x,
				   hls::stream<pixel_t, default_depth> &gradient_y,
				   hls::stream<pixel_t, default_depth> &gradient_z,
				   hls::stream<outer_pixel_t, default_depth> &outer_product_0,
				   hls::stream<outer_pixel_t, default_depth> &outer_product_1,
				   hls::stream<outer_pixel_t, default_depth> &outer_product_2,
				   hls::stream<outer_pixel_t, default_depth> &outer_product_3,
				   hls::stream<outer_pixel_t, default_depth> &outer_product_4,
				   hls::stream<outer_pixel_t, default_depth> &outer_product_5)
{
OUTER_OUTER:
	for (int r = 0; r < MAX_HEIGHT; r++)
	{
	OUTER_INNER:
		for (int c = 0; c < MAX_WIDTH; c++)
		{
#pragma HLS pipeline II = 1
			pixel_t grad[3];
			grad[0] = gradient_x.read();
			grad[1] = gradient_y.read();
			grad[2] = gradient_z.read();
			outer_pixel_t x = (outer_pixel_t)grad[0];
			outer_pixel_t y = (outer_pixel_t)grad[1];
			outer_pixel_t z = (outer_pixel_t)grad[2];
			outer_pixel_t out[6];
			out[0] = (x * x);
			out[1] = (y * y);
			out[2] = (z * z);
			out[3] = (x * y);
			out[4] = (x * z);
			out[5] = (y * z);
			outer_product_0.write(out[0]);
			outer_product_1.write(out[1]);
			outer_product_2.write(out[2]);
			outer_product_3.write(out[3]);
			outer_product_4.write(out[4]);
			outer_product_5.write(out[5]);
		}
	}
}

// tensor weight
void tensor_weight_y(hls::stream<outer_pixel_t, default_depth> &outer_0,
					 hls::stream<outer_pixel_t, default_depth> &outer_1,
					 hls::stream<outer_pixel_t, default_depth> &outer_2,
					 hls::stream<outer_pixel_t, default_depth> &outer_3,
					 hls::stream<outer_pixel_t, default_depth> &outer_4,
					 hls::stream<outer_pixel_t, default_depth> &outer_5,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_0,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_1,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_2,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_3,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_4,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_5)
{
	outer_pixel_t buf[3][MAX_WIDTH][6];
#pragma HLS array_partition variable = buf dim = 1 complete

	const pixel_t TENSOR_FILTER[] = {0.3243, 0.3513, 0.3243};
TENSOR_WEIGHT_Y_OUTER:
	for (int r = 0; r < MAX_HEIGHT + 1; r++)
	{
	TENSOR_WEIGHT_Y_INNER:
		for (int c = 0; c < MAX_WIDTH; c++)
		{
#pragma HLS pipeline II = 1
			outer_pixel_t tmp[6];
			shift_pixels_up_3_MAX_WIDTH_6(buf, c);
			if (r < MAX_HEIGHT)
			{
				tmp[0] = outer_0.read();
				tmp[1] = outer_1.read();
				tmp[2] = outer_2.read();
				tmp[3] = outer_3.read();
				tmp[4] = outer_4.read();
				tmp[5] = outer_5.read();
			}
			else
			{
			TENSOR_WEIGHT_Y_TMP_INIT:
				for (int i = 0; i < 6; i++)
#pragma HLS unroll
					tmp[i] = 0;
			}
			insert_bottom_row_3_MAX_WIDTH_6(buf, tmp, 6);

			outer_pixel_t acc[6];
		TENSOR_WEIGHT_Y_ACC_INIT:
			for (int k = 0; k < 6; k++)
#pragma HLS unroll
				acc[k] = 0;

			if (r >= 2 && r < MAX_HEIGHT)
			{
			TENSOR_WEIGHT_Y_TMP_OUTER:
				for (int i = 0; i < 3; i++)
				{
#pragma HLS unroll
					tmp[0] = buf[i][c][0];
					tmp[1] = buf[i][c][1];
					tmp[2] = buf[i][c][2];
					tmp[3] = buf[i][c][3];
					tmp[4] = buf[i][c][4];
					tmp[5] = buf[i][c][5];
					pixel_t k = TENSOR_FILTER[i];
				TENSOR_WEIGHT_Y_TMP_INNER:
					for (int component = 0; component < 6; component++)
					{
#pragma HLS unroll
						acc[component] += tmp[component] * k;
					}
				}
			}
			if (r >= 1)
			{
				tensor_y_0.write(acc[0]);
				tensor_y_1.write(acc[1]);
				tensor_y_2.write(acc[2]);
				tensor_y_3.write(acc[3]);
				tensor_y_4.write(acc[4]);
				tensor_y_5.write(acc[5]);
			}
		}
	}
}

void tensor_weight_x(hls::stream<outer_pixel_t, default_depth> &tensor_y_0,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_1,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_2,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_3,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_4,
					 hls::stream<outer_pixel_t, default_depth> &tensor_y_5,
					 hls::stream<outer_pixel_t, default_depth> &tensor_0,
					 hls::stream<outer_pixel_t, default_depth> &tensor_1,
					 hls::stream<outer_pixel_t, default_depth> &tensor_2,
					 hls::stream<outer_pixel_t, default_depth> &tensor_3,
					 hls::stream<outer_pixel_t, default_depth> &tensor_4,
					 hls::stream<outer_pixel_t, default_depth> &tensor_5)
{
	outer_pixel_t buf[1][3][6];
	const pixel_t TENSOR_FILTER[] = {0.3243, 0.3513, 0.3243};
TENSOR_WEIGHT_X_OUTER:
	for (int r = 0; r < MAX_HEIGHT; r++)
	{
	TENSOR_WEIGHT_X_INNER:
		for (int c = 0; c < MAX_WIDTH + 1; c++)
		{
#pragma HLS pipeline II = 1
			shift_pixels_left_1_3_6(buf);
			outer_pixel_t tmp[6];
			if (c < MAX_WIDTH)
			{
				tmp[0] = tensor_y_0.read();
				tmp[1] = tensor_y_1.read();
				tmp[2] = tensor_y_2.read();
				tmp[3] = tensor_y_3.read();
				tmp[4] = tensor_y_4.read();
				tmp[5] = tensor_y_5.read();
			}
			else
			{
			TENSOR_WEIGHT_X_TMP_INIT:
				for (int i = 0; i < 6; i++)
#pragma HLS unroll
					tmp[i] = 0;
			}
			insert_pixel_1_3_6(buf, tmp, 0, 2);
			outer_pixel_t acc[6];
		TENSOR_WEIGHT_X_ACC_INIT:
			for (int k = 0; k < 6; k++)
#pragma HLS unroll
				acc[k] = 0;
			if (c >= 2 && c < MAX_WIDTH)
			{
			TENSOR_WEIGHT_X_TMP_OUTER:
				for (int i = 0; i < 3; i++)
				{
#pragma HLS unroll
					tmp[0] = buf[0][i][0];
					tmp[1] = buf[0][i][1];
					tmp[2] = buf[0][i][2];
					tmp[3] = buf[0][i][3];
					tmp[4] = buf[0][i][4];
					tmp[5] = buf[0][i][5];
				TENSOR_WEIGHT_X_TMP_INNER:
					for (int component = 0; component < 6; component++)
					{
#pragma HLS unroll
						acc[component] += tmp[component] * TENSOR_FILTER[i];
					}
				}
			}
			if (c >= 1)
			{
				tensor_0.write(acc[0]);
				tensor_1.write(acc[1]);
				tensor_2.write(acc[2]);
				tensor_3.write(acc[3]);
				tensor_4.write(acc[4]);
				tensor_5.write(acc[5]);
			}
		}
	}
}

// compute output flow
void flow_calc(hls::stream<outer_pixel_t, default_depth> &tensors_0,
			   hls::stream<outer_pixel_t, default_depth> &tensors_1,
			   hls::stream<outer_pixel_t, default_depth> &tensors_2,
			   hls::stream<outer_pixel_t, default_depth> &tensors_3,
			   hls::stream<outer_pixel_t, default_depth> &tensors_4,
			   hls::stream<outer_pixel_t, default_depth> &tensors_5,
			   vel_pixel_t outputs[MAX_HEIGHT][MAX_WIDTH][2])
{
	outer_pixel_t buf[2];
FLOW_OUTER:
	for (int r = 0; r < MAX_HEIGHT; r++)
	{
	FLOW_INNER:
		for (int c = 0; c < MAX_WIDTH; c++)
		{
#pragma HLS pipeline II = 1
			outer_pixel_t tmp_tensor[6];
			tmp_tensor[0] = tensors_0.read();
			tmp_tensor[1] = tensors_1.read();
			tmp_tensor[2] = tensors_2.read();
			tmp_tensor[3] = tensors_3.read();
			tmp_tensor[4] = tensors_4.read();
			tmp_tensor[5] = tensors_5.read();
			if (r >= 2 && r < MAX_HEIGHT - 2 && c >= 2 && c < MAX_WIDTH - 2)
			{
				calc_pixel_t t1 = (calc_pixel_t)tmp_tensor[0];
				calc_pixel_t t2 = (calc_pixel_t)tmp_tensor[1];
				calc_pixel_t t3 = (calc_pixel_t)tmp_tensor[2];
				calc_pixel_t t4 = (calc_pixel_t)tmp_tensor[3];
				calc_pixel_t t5 = (calc_pixel_t)tmp_tensor[4];
				calc_pixel_t t6 = (calc_pixel_t)tmp_tensor[5];

				calc_pixel_t denom = t1 * t2 - t4 * t4;
				calc_pixel_t numer0 = t6 * t4 - t5 * t2;
				calc_pixel_t numer1 = t5 * t4 - t6 * t1;

				if (denom != 0)
				{
					buf[0] = numer0 / denom;
					buf[1] = numer1 / denom;
				}
				else
				{
					buf[0] = 0;
					buf[1] = 0;
				}
			}
			else
			{
				buf[0] = buf[1] = 0;
			}
			outputs[r][c][0] = (vel_pixel_t)buf[0];
			outputs[r][c][1] = (vel_pixel_t)buf[1];
		}
	}
}

// top-level kernel function
void optical_flow(frames_t frames[MAX_HEIGHT][MAX_WIDTH],
				  vel_pixel_t outputs[MAX_HEIGHT][MAX_WIDTH][2])
{
#pragma HLS DATAFLOW

	// FIFOs connecting the stages

	hls::stream<pixel_t, default_depth> gradient_x;
	hls::stream<pixel_t, default_depth> gradient_y;
	hls::stream<pixel_t, max_width * 4> gradient_z;

	hls::stream<pixel_t, default_depth> y_filtered_x;
	hls::stream<pixel_t, default_depth> y_filtered_y;
	hls::stream<pixel_t, default_depth> y_filtered_z;

	hls::stream<pixel_t, default_depth> filtered_gradient_x;
	hls::stream<pixel_t, default_depth> filtered_gradient_y;
	hls::stream<pixel_t, default_depth> filtered_gradient_z;

	hls::stream<outer_pixel_t, default_depth> out_product_0;
	hls::stream<outer_pixel_t, default_depth> out_product_1;
	hls::stream<outer_pixel_t, default_depth> out_product_2;
	hls::stream<outer_pixel_t, default_depth> out_product_3;
	hls::stream<outer_pixel_t, default_depth> out_product_4;
	hls::stream<outer_pixel_t, default_depth> out_product_5;

	hls::stream<outer_pixel_t, default_depth> tensor_y_0;
	hls::stream<outer_pixel_t, default_depth> tensor_y_1;
	hls::stream<outer_pixel_t, default_depth> tensor_y_2;
	hls::stream<outer_pixel_t, default_depth> tensor_y_3;
	hls::stream<outer_pixel_t, default_depth> tensor_y_4;
	hls::stream<outer_pixel_t, default_depth> tensor_y_5;

	hls::stream<outer_pixel_t, default_depth> tensor_0;
	hls::stream<outer_pixel_t, default_depth> tensor_1;
	hls::stream<outer_pixel_t, default_depth> tensor_2;
	hls::stream<outer_pixel_t, default_depth> tensor_3;
	hls::stream<outer_pixel_t, default_depth> tensor_4;
	hls::stream<outer_pixel_t, default_depth> tensor_5;

	// FIFOs for streaming in, just for clarity
	hls::stream<input_t, default_depth> frame1_a;
	hls::stream<input_t, default_depth> frame2_a;
	hls::stream<input_t, default_depth> frame4_a;
	hls::stream<input_t, default_depth> frame5_a;

	// Need to duplicate frame3 for the two calculations
	hls::stream<input_t, default_depth> frame3_a;
	hls::stream<input_t, default_depth> frame3_b;

	// stream in and organize the inputs
	frames_t buf;
FRAMES_CP_OUTER:
	for (int r = 0; r < MAX_HEIGHT; r++)
	{
	FRAMES_CP_INNER:
		for (int c = 0; c < MAX_WIDTH; c++)
		{
#pragma HLS pipeline II = 1

			// one wide read
			buf = frames[r][c];
			// assign values to the FIFOs
			frame1_a.write((input_t)(buf & 0xff) / 256);
			frame2_a.write((input_t)((buf & 0xff00) >> 8) / 256);
			frame3_a.write((input_t)((buf & 0xff0000) >> 16) / 256);
			frame3_b.write((input_t)((buf & 0xff0000) >> 16) / 256);
			frame4_a.write((input_t)((buf & 0xff000000) >> 24) / 256);
			frame5_a.write((input_t)((buf & 0xff00000000) >> 32) / 256);
		}
	}
	// compute
	gradient_xy_calc(frame3_a, gradient_x, gradient_y);
	gradient_z_calc(frame1_a, frame2_a, frame3_b, frame4_a, frame5_a, gradient_z);
	gradient_weight_y(gradient_x, gradient_y, gradient_z, y_filtered_x, y_filtered_y, y_filtered_z);
	gradient_weight_x(y_filtered_x, y_filtered_y, y_filtered_z, filtered_gradient_x, filtered_gradient_y, filtered_gradient_z);
	outer_product(filtered_gradient_x, filtered_gradient_y, filtered_gradient_z, out_product_0, out_product_1, out_product_2, out_product_3, out_product_4, out_product_5);
	tensor_weight_y(out_product_0, out_product_1, out_product_2, out_product_3, out_product_4, out_product_5, tensor_y_0, tensor_y_1, tensor_y_2, tensor_y_3, tensor_y_4, tensor_y_5);
	tensor_weight_x(tensor_y_0, tensor_y_1, tensor_y_2, tensor_y_3, tensor_y_4, tensor_y_5, tensor_0, tensor_1, tensor_2, tensor_3, tensor_4, tensor_5);
	flow_calc(tensor_0, tensor_1, tensor_2, tensor_3, tensor_4, tensor_5, outputs);
}
