(module
    ;; allocate memory => 64k
    (memory $mem 1)

    ;; define global variables to hold hours and minutes
    (global $minutes (mut i32) (i32.const 0))
    (global $hours (mut i32) (i32.const 0))

    ;; getter and setter minutes
    (func $get_minutes (result i32)
        (global.get $minutes)
    )

    (func $set_minutes (param $mnts i32)
        (global.set $minutes (local.get $mnts))
    )

    ;; getter and setter hours
    (func $get_hours (result i32)
        (global.get $hours)
    )

    (func $set_hours (param $hrs i32)
        (global.set $hours (local.get $hrs))
    )

    ;; convert hours and minutes to clock time
    (func $clock (param $hrs i32) (param $mnts i32)
        (local $total_minutes i32)
        (local.set $total_minutes (i32.add
            (i32.mul (local.get $hrs) (i32.const 60))
            (local.get $mnts)
        ))
        (if
            (i32.lt_u
                (local.get $total_minutes)
                (i32.const 0)
            )
        (then
            (local.set $total_minutes (call $arithmetic_clock(local.get $total_minutes)))
        )
        (else)
        )
        ;; set minutes and hours
        (call $set_hours (i32.rem_u
            (i32.div_u (local.get $total_minutes) (i32.const 60))
            (i32.const 24)
        ))
        (call $set_minutes (i32.rem_u
            (local.get $total_minutes) (i32.const 60)
        ))
    )

    ;; total_minutes += (1 - total_minutes / (24 * 60)) * 24 * 60
    (func $arithmetic_clock (param $minutes i32) (result i32)
        (local $minutes_to_add i32)
        (local.set $minutes_to_add (
            i32.mul
            (i32.sub
                (i32.const 1)
                (i32.div_u
                    (local.get $minutes)
                    (i32.const 1440)
                )
            )
            (i32.const 1440)
        ))
        (i32.add
            (local.get $minutes) (local.get $minutes_to_add)
        )
    )

    (export "clock" (func $clock))
    (export "hours" (func $get_hours))
    (export "minutes" (func $get_minutes))
)