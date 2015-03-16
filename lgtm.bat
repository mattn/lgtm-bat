@echo off

setlocal enabledelayedexpansion
goto main

:usage
  echo usage: %~n0 [-m]
  goto :eof

:lgtm_markdown
  call :lgtm_fetch
  echo [![LGTM](%lgtm%))](http://lgtm.herokuapp.com/)
  goto :eof

:lgtm
  call :lgtm_fetch
  echo %lgtm%
  goto :eof

:lgtm_fetch
  set lgtm=
  for /F %%I in ('curl -sL "http://publicdomaingifs.tumblr.com/random" ^| pup "meta[name=twitter:image] attr{content}"') do (
    set lgtm=%%I
  )
  goto :eof

:main
  if "%1" equ "-m" goto :lgtm_markdown
  if "%1" equ "" goto :lgtm
  call :usage
