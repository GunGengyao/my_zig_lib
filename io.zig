//!
//!
//!

const std = @import("std");

pub fn cake_is_a_lie() void {
    std.debug.print(
        \\  -------------
        \\  *   CAKE    *
        \\  *    IS     *
        \\  *    A      *
        \\  *    LIE    *
        \\  -------------
    , .{});
    return;
}
