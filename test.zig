//! This is a test file

const std = @import("std");
const allocator = @import("allocator.zig");
const io = @import("io.zig");
const math = @import("math.zig");

test "allocator" {
    // TODO
}

test "io" {
    // test read_file_as_string
    //const malloc = allocator.malloc;
    const free = allocator.free;
    //const realloc = allocator.realloc;
    const str = io.read_file_as_string("test.zig");
    try io.printf("{s}swswwdhojcoidwji", .{"ssss"});
    free(str);
}

test "math" {
    // TODO
}

pub fn main() void {
    // test read_file_as_string
    //const malloc = allocator.malloc;
    const free = allocator.free;
    //const realloc = allocator.realloc;
    const str = io.read_file_as_string("test.zig");
    std.debug.print("{s}", .{str[0..12]});
    free(str);
}
