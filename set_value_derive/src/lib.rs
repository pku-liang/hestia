extern crate proc_macro;
use proc_macro::{TokenStream};
use quote::{quote};
use syn::DeriveInput;
use syn::{self, Data};

#[proc_macro_derive(SetValue)]
pub fn set_value_derive(input: TokenStream) -> TokenStream {
    let ast: DeriveInput = syn::parse(input).unwrap();
    let id = ast.ident;
    let Data::Struct(s) = ast.data else {
        panic!("SetValue derive macro must use in struct");
    };
    let mut element = quote!();
    let mut vector = quote!();
    let mut get_element = quote!();
    let mut get_vector = quote!();
    let mut new_element = quote!();
    let mut valid = quote!();
    for f in s.fields.iter() {
        let (field_id, field_ty) = (&f.ident, &f.ty);
        if let Some(field_id) = field_id {
            let id_str = field_id.to_string();
            let field_type = syn::parse_str::<syn::Type>(&quote!(#field_ty).to_string()).unwrap();
            let field_type_name = quote!(#field_type).to_string();

            match &field_type_name as &str {
                "VALUE" => {
                    new_element.extend(quote! { #field_id: VALUE::ERROR, });
                }
                "TEHB" | "OEHB" | "Join" | "Fork" | "MergeNoTehb" | "ElasticBuffer" | "DelayBuffer" | "Reg" => {
                    new_element.extend(quote! { #field_id: #field_ty::new(), });
                }
                "HandshakeValue" => {
                    element.extend(quote! { #id_str => { self.#field_id = val } });
                    get_element.extend(quote! { #id_str => { self.#field_id } });
                    new_element.extend(quote! { #field_id: #field_ty::empty(), });
                    valid.extend(quote! {
                        if self.#field_id.valid {
                            return true
                        }
                    })
                }
                "Vec < HandshakeValue >" => {
                    vector.extend(quote! {
                        if str.starts_with(#id_str) {
                            if let Some((_, b)) = str.split_once(".") {
                                self.#field_id[b.parse::<usize>().unwrap()] = val;
                                return
                            }
                        }
                    });
                    get_vector.extend(quote! {
                        if str.starts_with(#id_str) {
                            if let Some((_, b)) = str.split_once(".") {
                                return self.#field_id[b.parse::<usize>().unwrap()]
                            }
                        }
                    });
                    new_element.extend(quote! { #field_id: <#field_ty>::default(), });
                    valid.extend(quote! {
                        for data in &self.#field_id {
                            if data.valid {
                                return true
                            }
                        }
                    })
                }
                "fn(& Vec < VALUE >) -> VALUE" => {
                    new_element.extend(quote! { #field_id: |x| VALUE::ERROR});
                }
                _ => {
                    // println!(".....{}", field_type_name);
                    new_element.extend(quote! { #field_id: <#field_ty>::default(), });
                }
            }
        }
    }

    quote! {
        impl New for #id {
            fn new() -> Self {
                Self {
                    #new_element
                }
            }
        }

        impl SetValue for #id {
            fn set_value(&mut self, port: &str, val: HandshakeValue) {
                match port {
                    #element
                    str => {
                        #vector
                    }
                }
            }

            fn get_value(&mut self, port: &str) -> HandshakeValue {
                match port {
                    #get_element
                    str => {
                        #get_vector
                        panic!("{}", str)
                    }
                }
            }

            fn is_valid(&self) -> bool {
                #valid
                false
            }
        }
    }
    .into()
}
