echo 📚 API DOCS
call yarn clean
call yarn build
call yarn lerna run api-report
echo Generating Markdown Docs
if EXIST docs\_config.yml (
set GH_PAGES_CFG_EXISTS=1
) else (
set GH_PAGES_CFG_EXISTS=
)

if "%GH_PAGES_CFG_EXISTS%"==1 (
  echo "GitHub pages config file DETECTED"
  xcopy /q docs/_config.yml
)

call yarn api-documenter markdown -i temp -o docs

if "%GH_PAGES_CFG_EXISTS%"==1 (
  XCOPY _config.yml docs/_config.yml
)

