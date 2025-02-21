@echo on

set PYTHONIOENCODING="UTF-8"
set PYTHONUTF8=1
set RUST_BACKTRACE=1
set TEMP="%SRC_DIR%\tmpbuild_%PY_VER%"
set PYO3_PYTHON=%PYTHON%

mkdir "%TEMP%"

%PYTHON% -m pip install -vv . --no-deps --no-build-isolation ^
    || exit 1

:: dump licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output "%SRC_DIR%\THIRDPARTY.yml" ^
    || exit 1
