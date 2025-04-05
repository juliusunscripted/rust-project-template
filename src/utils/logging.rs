use log;
use std::env;

pub fn init() {
    let mut custom_env_var_rust_log = true;
    if env::var("RUST_LOG").is_err() {
        custom_env_var_rust_log = false;
        let project = "rust_project_template";
        let env_var_value = format!("warn,{project}=info");
        // ensure that the environment access only happens in single-threaded code.
        unsafe { env::set_var("RUST_LOG", env_var_value) };
    }
    let rust_log = env::var("RUST_LOG").unwrap();
    // env_logger::init();
    env_logger::builder()
        .format_file(true)
        .format_line_number(true)
        .init();
    if !custom_env_var_rust_log {
        log::info!(rust_log; "initialized logger with project default module level configuration");
    } else {
        log::info!(rust_log; "initialized logger with custom  module level configuration (set via environment variable 'RUST_LOG'")
    }
}
