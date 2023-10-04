//! This file contains allocators

const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("stdlib.h");
});

pub fn malloc(size: u64, comptime T: anytype) [*]T {
    const total_space = @sizeOf(T) * size;
    const c_total_space = @as(c_ulong, total_space);
    // WARNING...
    const c_ans = c.malloc(c_total_space);
    const ans: [*]T = @ptrCast(@alignCast(c_ans));
    return ans;
}

pub fn realloc(
    comptime T: anytype,
    input: [*]T,
    new_size: u64,
) [*]T {
    const c_new_size: c_ulong = @as(c_ulong, new_size);
    const c_input: *anyopaque = @ptrCast(input);
    const c_ans = c.realloc(c_input, c_new_size);
    const ans: [*]T = @ptrCast(@alignCast(c_ans));
    return ans;
}
pub fn free(input: *anyopaque) void {
    c.free(input);
    return;
}
