/*===============================================================*/
/*                                                               */
/*                       optical_flow.h                          */
/*                                                               */
/*             Hardware function for optical flow                */
/*                                                               */
/*===============================================================*/

#ifndef __OPTICAL_FLOW_H__
#define __OPTICAL_FLOW_H__

const int MAX_HEIGHT = 436;
const int MAX_WIDTH = 1024;

typedef float input_t;
typedef float pixel_t;
typedef float outer_pixel_t;
typedef float vel_pixel_t;
typedef double calc_pixel_t;


typedef unsigned long long frames_t;
// convolution filters
const int GRAD_WEIGHTS[5] =  {1,-8,0,8,-1};
const pixel_t GRAD_FILTER[7] = {0.0755, 0.133, 0.1869, 0.2903, 0.1869, 0.133, 0.0755};
const pixel_t TENSOR_FILTER[3] = {0.3243, 0.3513, 0.3243};

// top-level function
extern "C" {
void optical_flow(frames_t   frames[MAX_HEIGHT][MAX_WIDTH],
                  vel_pixel_t outputs[MAX_HEIGHT][MAX_WIDTH][2]);
}
#endif
