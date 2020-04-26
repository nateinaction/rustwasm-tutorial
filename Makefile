.PHONY: all
all: setup build test

.PHONY: setup
setup: install_wasm_pack npm_install

.PHONY: install_wasm_pack
install_wasm_pack:
	curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

.PHONY: npm_install
npm_install:
	cd www && npm install

.PHONY: build
build:
	wasm-pack build

.PHONY: test
test:
	wasm-pack test --firefox --chrome --headless

.PHONY: preview
preview:
	cd www && npm run start
