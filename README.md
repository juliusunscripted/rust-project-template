# rust-project-template
You can use this template to start a new rust project.


## Getting started

### Create your project

- create your own repo by using this template
- rename your package
	- in `Cargo.toml`
- rename `project` variable in `src/main.rs` for log level configuration

### Run it

#### Basic run command

- you can run the code via
	```bash
	cargo run
	```

#### Adjust log levels per module

- set the environment variable `RUST_LOG` to configure log levels per module
	```bash
	RUST_LOG="warn,rust_project_template::example_module::example_submodule=debug" cargo run
	```
