call scripts\tools\vs-env.cmd -arch=x64 -host_arch=x64

if [%SW_SWIFT_BRANCH_SPEC%]==[5.2] (
  call scripts\tools\set-env.cmd SW_LLVM_REF swift/swift-5.2-branch
  call scripts\tools\set-env.cmd SW_CMARK_REF swift-5.2-branch
  call scripts\tools\set-env.cmd SW_DISPATCH_REF swift-5.2-branch
  call scripts\tools\set-env.cmd SW_SWIFT_REF swift-5.2-branch

  call scripts\tools\set-env.cmd SW_LLDB_OPTIONS "-DLLDB_DISABLE_PYTHON=YES"
) else if [%SW_SWIFT_BRANCH_SPEC%]==[5.3] (
  call scripts\tools\set-env.cmd SW_LLVM_REF swift/release/5.3
  call scripts\tools\set-env.cmd SW_CMARK_REF release/5.3
  call scripts\tools\set-env.cmd SW_DISPATCH_REF release/5.3
  call scripts\tools\set-env.cmd SW_SWIFT_REF release/5.3
) else (
  call scripts\tools\set-env.cmd SW_LLVM_REF swift/master
  call scripts\tools\set-env.cmd SW_CMARK_REF master
  call scripts\tools\set-env.cmd SW_DISPATCH_REF master
  call scripts\tools\set-env.cmd SW_SWIFT_REF master
)

if not defined GITHUB_ACTION (
  if [%SW_SWIFT_BRANCH_SPEC%]==[5.2] (
    call scripts\tools\set-env.cmd SW_PYTHON_OPTIONS "-D PYTHON_EXECUTABLE=C:\Python27\python.exe"
  )
) else (
  call scripts\tools\set-env.cmd SW_PYTHON_OPTIONS "-D PYTHON_EXECUTABLE=%pythonLocation%\python.exe"
)

call scripts\tools\set-env.cmd SW_LLVM_PROJECT_SOURCES_DIR %SW_SOURCES_DIR%\llvm-project
call scripts\tools\set-env.cmd SW_LLVM_SOURCES_DIR %SW_LLVM_PROJECT_SOURCES_DIR%\llvm
call scripts\tools\set-env.cmd SW_CMARK_SOURCES_DIR %SW_LLVM_PROJECT_SOURCES_DIR%\cmark
call scripts\tools\set-env.cmd SW_SWIFT_SOURCES_DIR %SW_LLVM_PROJECT_SOURCES_DIR%\swift
call scripts\tools\set-env.cmd SW_DISPATCH_SOURCES_DIR %SW_SOURCES_DIR%\swift-corelibs-libdispatch

call scripts\tools\set-env.cmd SW_LLVM_TOOLS_BUILD_DIR %SW_BUILD_DIR%\llvm-tools
call scripts\tools\set-env.cmd SW_TOOLCHAIN_BUILD_DIR %SW_BUILD_DIR%\toolchain

call scripts\tools\set-env.cmd SW_TOOLCHAIN_INSTALL_DIR %SW_INSTALL_DIR%\Library\Developer\Toolchains\unknown-Asserts-development.xctoolchain\usr
call scripts\tools\set-env.cmd SW_ICU_PATH %SW_ARTIFACTS_DIR%\Library\icu-%SW_ICU_VERSION%

call scripts\tools\set-env.cmd SW_LLVM_TABLEGEN %SW_LLVM_TOOLS_BUILD_DIR%\bin\llvm-tblgen.exe
call scripts\tools\set-env.cmd SW_CLANG_TABLEGEN %SW_LLVM_TOOLS_BUILD_DIR%\bin\clang-tblgen.exe
call scripts\tools\set-env.cmd SW_LLDB_TABLEGEN %SW_LLVM_TOOLS_BUILD_DIR%\bin\lldb-tblgen.exe