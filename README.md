# rust-project-template

You can use this template to start a new rust project.

## Prerequisites

### Install rust

#### Via rustup

- [via rustup](https://www.rust-lang.org/tools/install)

#### Via nix flake

- ([install nix and open nix flake development shell](https://www.juliusunscripted.com/posts/configure-nix-flake-development-shell/))
- the git repo contains a `flake.nix` configuration
- you can open a dev shell via
	```bash
	nix develop
	```
- you can open vscode from inside the nix dev shell via
	- option 1:
		```bash
		nix develop --command code .
		```
	- option 2:
		```bash
		./ctl.sh nix:vscode
		```


## Getting started

### Create your project

- create your own repo by using this template
- rename your package
	- in `Cargo.toml`
- rename `project` variable in `src/main.rs` for log level configuration

### Run your app

#### Basic run command

- you can run the code via
	```bash
	cargo run
	```

- this template use a rust crate called *clap* for cli development
- use cli arguments after two dashes `--` when running the program via `cargo`
	```bash
	# cli help
	cargo run -- -h

	# example run
	cargo run -- --name Julius --count 3
	```


#### Adjust log levels per module

- set the environment variable `RUST_LOG` to configure log levels per module

##### Set env var inline

```bash
RUST_LOG="warn,rust_project_template::example_module::example_submodule=debug" cargo run
```

##### Use .env file with bash script

> [details about ctl.sh script](https://www.juliusunscripted.com/bash-script-with-env-file-variables-and-commands/)

- create a file called `.env` in the root dir of the repo
	```bash
	RUST_LOG="warn,rust_project_template::example_module::example_submodule=debug"
	```
- run you app with the following command
	```bash
	./ctl.sh cargo:run
	```
