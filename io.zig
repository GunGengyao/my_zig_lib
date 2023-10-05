//!
//!
//!

const std = @import("std");
const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("stdlib.h");
});
const allocator = @import("allocator.zig");
const malloc = allocator.malloc;
const free = allocator.free;
const realloc = allocator.realloc;
// read bare text file
pub fn read_file_as_string(path: []const u8) [*]u8 {
    const c_path: [*c]const u8 = @ptrCast(path);
    const fp = c.fopen(c_path, "r");
    var x: c_int = c.fgetc(fp);
    // get size of file
    var file_size: usize = 0;
    while (x != c.EOF) : (x = c.fgetc(fp)) {
        //std.debug.print("{c}", .{@as(u8, @intCast(x))});
        file_size += 1;
    }
    const ans = malloc(file_size + 1, u8);
    // write to ans again.
    //
    _ = c.fclose(fp);
    const rfp = c.fopen(c_path, "r");
    file_size = 0;
    x = c.fgetc(rfp);
    while (x != c.EOF) : (x = c.fgetc(rfp)) {
        ans[file_size] = @as(u8, @intCast(x));
        file_size += 1;
    }
    ans[file_size] = 0;
    _ = c.fclose(rfp);
    return ans;
}

// actual print
pub fn printf(comptime fmt: []const u8, arge: anytype) !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print(fmt, arge);
    try bw.flush();
    return;
}

// Cake is actually lie!!!
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
