# Hestia: An Efficient Cross-level Debugger for High-level Synthesis

# Setup

## Install Rust

```bash
curl https://sh.rustup.rs -sSf | sh
```

## Build Hestia

```bash
git clone https://github.com/pku-liang/hestia.git
cargo build --all --release
```

## Error Encountered When Building Hestia

If you encounter the following error:
```bash
Error[E0658]: #[diagnostic] attribute name space is experimental
```

You can resolve this by installing and setting the nightly version of Rust:

```bash
rustup install nightly
rustup default nightly
```
