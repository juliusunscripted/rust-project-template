mod utils;
mod example_module;

use utils::logging;
use utils::arguments;

use log;

fn main() {

    println!("Hello, world!");

    logging::init();
    
    log::info!("hello via logger in main");

    example_module::example_submodule::hi();

    let args = arguments::parse_args();

    for _ in 0..args.count {
        println!("Hello {}!", args.name);
    }
}
