#!/bin/bash
# symlink .githooks/ to .git/hooks/
rm .git/hooks/*
find .git/hooks -type l -exec rm {} \; && find .githooks -type f -exec ln -sf ../../{} .git/hooks/ \;


# Set this variable to true if you also want to run 
# unit & mutation tests on pre-commit hook.
# Default is only static analysis.
PERFORM_ALL_TESTS=true

# Notice: only bash and zsh supported.
# If you have another shell,
# set PRECOMMITALLTESTS environment variable manually.
shell=$(echo $SHELL)
export PRECOMMITALLTESTS=$PERFORM_ALL_TESTS

if [[ ${shell} == *"bash"* ]]; then # shell name contains "bash"
  if [ -f ~/.bashrc ]; then # ~/.bashrc exists
    sed -i '/PRECOMMITALLTESTS/d' ~/.bashrc # remove old entry
    # For setting the env var permanently
    echo "export PRECOMMITALLTESTS=${PERFORM_ALL_TESTS}" >> ~/.bashrc
    echo "Successfully exported PRECOMMITALLTESTS=${PERFORM_ALL_TESTS} in ~/.bashrc"
  fi 
  if [ -f ~/.bash_profile ]; then
    sed -i '/PRECOMMITALLTESTS/d' ~/.bash_profile # remove old entry
    echo "export PRECOMMITALLTESTS=${PERFORM_ALL_TESTS}" >> ~/.bash_profile
    echo "Successfully exported PRECOMMITALLTESTS=${PERFORM_ALL_TESTS} in ~/.bash_profile"
  fi 
  if [ -f ~/.profile ]; then
    sed -i '/PRECOMMITALLTESTS/d' ~/.profile # remove old entry
    echo "export PRECOMMITALLTESTS=${PERFORM_ALL_TESTS}" >> ~/.profile
    echo "Successfully exported PRECOMMITALLTESTS=${PERFORM_ALL_TESTS} in ~/.profile"
  fi 
fi
if [[ ${shell} == *"zsh"* ]]; then # shell name contains "zsh"
  if [ -f ~/.zprofile ]; then
    sed -i '/PRECOMMITALLTESTS/d' ~/.zprofile # remove old entry
    echo "export PRECOMMITALLTESTS=${PERFORM_ALL_TESTS}" >> ~/.zprofile
    echo "Successfully exported PRECOMMITALLTESTS=${PERFORM_ALL_TESTS} in ~/.zprofile"
  fi 
  if [ -f ~/.zshrc ]; then
    sed -i '/PRECOMMITALLTESTS/d' ~/.zshrc # remove old entry
    echo "export PRECOMMITALLTESTS=${PERFORM_ALL_TESTS}" >> ~/.zshrc
    echo "Successfully exported PRECOMMITALLTESTS=${PERFORM_ALL_TESTS} in ~/.zshrc"
  fi 
fi
