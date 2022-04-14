fetch('./clock.wasm').then(response =>
    response.arrayBuffer()
).then(bytes => WebAssembly.instantiate(bytes)).then(results => {
    console.log("Loaded wasm module");
    instance = results.instance;
    console.log("instance", instance);

    console.log("Test positive values")
    var hoursTestOne = 25;
    var minutesTestOne = 72;
    instance.exports.clock(hoursTestOne, minutesTestOne);
    var clockMinutesTestOne = instance.exports.minutes();
    var clockHoursTestOne = instance.exports.hours();
    console.log(hoursTestOne + " hours and " + minutesTestOne + " minutes");
    console.log("gives " + formatClock(clockHoursTestOne, clockMinutesTestOne));

    console.log("Test negative minutes values")
    var hoursTestTwo = 12;
    var minutesTestTwo = -145;
    instance.exports.clock(hoursTestTwo, minutesTestTwo);
    var clockMinutesTestTwo = instance.exports.minutes();
    var clockHoursTestTwo = instance.exports.hours();
    console.log(hoursTestTwo + " hours and " + minutesTestTwo + " minutes");
    console.log("gives " + formatClock(clockHoursTestTwo, clockMinutesTestTwo));
});

function formatClock(hours, minutes) {
    const formatedHours = hours.toString().padStart(2, '0');
    const formatedMinutes = minutes.toString().padStart(2, '0');
    return formatedHours + ":" + formatedMinutes;
}