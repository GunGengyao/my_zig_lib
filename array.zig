//! array processing
//!
//!
//!

const std = @import("std");
const allocator = @import("../allocator.zig");
const malloc = allocator.malloc;
const free = allocator.free;
const realloc = allocator.realloc;
const ErrorOfArray = error{
    InitSizeArrangeError,
};

pub fn new_array(comptime T: type) type {
    const ans: type = struct {
        content: [*]T,
        size: usize,
        // This function must execute after variable been set
        pub fn init(self: *@This(), size: usize) !void {
            // Check if size>0;
            if (size <= 0) {
                return ErrorOfArray.InitSizeArrangeError;
            }
            self.*.content = malloc(size, T);
            self.*.size = size;
            return;
        }
        // This function insert 'target' at 'where' of 'self'
        pub fn insert(self: *@This(), target: @This(), where: usize) !void {
            const new_size: usize = target.size + self.*.size;
            const new_content: [*]T = malloc(new_size, T);
            var new_content_cursor: usize = 0;
            var content_cursor: usize = 0;
            while (new_content_cursor < where) : ({
                new_content_cursor += 1;
                content_cursor += 1;
            }) {
                new_content[new_content_cursor] = self.*.content[content_cursor];
            }
            //TODO
            return;
        }
        // This function delete content of self in range 'start','end'.
        pub fn delete(self: *@This(), start: usize, end: usize) !void {
            _ = start;
            _ = end;
            _ = self;
            // TODO
            return;
        }
    };
    return ans;
}
