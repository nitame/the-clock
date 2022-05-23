use wasm_bindgen::prelude::*;
use web_sys::console;

mod clock;

#[wasm_bindgen]
pub fn print_clock(hours: i32, minutes: i32) {
    let clock = clock::Clock::new(hours, minutes);
    let output = format!(
        "{} hours and {} minutes to clock format -> {}",
        hours, minutes, clock
    );
    console::log_1(&output.into());
}
