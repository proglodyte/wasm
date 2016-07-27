MKTEMPDIR ?= /usr/bin
DESTDIR ?= /usr/local

build:

install:
	@if [[ -z "${D8DIR}" ]]; then echo "please set D8DIR" 2>&1; exit 1; fi
	@if [[ -z "${SWDIR}" ]]; then echo "please set SWDIR" 2>&1; exit 1; fi

	@sudo mkdir -p "${DESTDIR}/bin" "${DESTDIR}/lib"
	@sudo cp wasm.js "${DESTDIR}/lib/"
	@sudo cp wasm wast "${DESTDIR}/bin/"
	@sudo sed -i -e "s|DESTDIR|${DESTDIR}|g" \
							 -e "s|D8DIR|${D8DIR}|g" \
							 -e "s|SWDIR|${SWDIR}|g" \
							 -e "s|MKTEMPDIR|${MKTEMPDIR}|g" \
							 "${DESTDIR}/bin/wasm" "${DESTDIR}/bin/wast"
