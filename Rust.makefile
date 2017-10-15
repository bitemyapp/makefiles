package = your-package-name

env = OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
cargo = $(env) cargo
debug-env = RUST_BACKTRACE=1 RUST_LOG=$(package)=debug
debug-cargo = $(env) $(debug-env) cargo

build:
	$(cargo) build

build-release:
	$(cargo) build --release

run: build
	./target/debug/$(package)

install:
	$(cargo) install --force

test:
	$(cargo) test

test-debug:
	$(debug-cargo) test -- --nocapture

fmt:
	$(cargo) fmt

watch:
	$(cargo) watch -- cargo build

# You need nightly for rustfmt at the moment
dev-deps:
	$(cargo) install fmt
	$(cargo) install rustfmt-nightly

.PHONY : build build-release run install test test-debug fmt watch dev-deps
