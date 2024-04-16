install: clean
  mkdir just_install
  mkdir just_tmp
  cp ./core/ ./main/ just_tmp -r
  CMD_STORM_INSTALL_PATH=just_install fish ./just_tmp/core/bin/compile.fish ./just_tmp/
  mv just_tmp/{assets,lua,bin,src,pkgs} just_install # TODO This should be done by a install.sh
  rm just_tmp -rf

clean:
  rm just_install -rf
