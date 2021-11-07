@echo off

echo for start
for /F %%l in ('type newfiles') do (
    echo if start
    if "%l%"=="folder" set state=1
    else if "%%l"=="file" set state=0
    else if exist "%%l" (
        if %state%==0 echo "file: %%l"
        else if %state%==1 echo "folder: %%l"
    )
    echo if end
)
echo for end

echo on