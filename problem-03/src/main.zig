const std = @import("std");

const List = struct {
    value: u8,
    next: ?*List,
};

fn nthElement(list: *List, n: usize) ?u8 {
    if (n == 0) {
        return list.value;
    }

    if (list.next == null) {
        return null;
    }

    return nthElement(list.next.?, n - 1);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var a = List{ .value = 3, .next = null };
    var b = List{ .value = 4, .next = &a };

    try std.testing.expect(nthElement(&a, 0) == 3);
    try std.testing.expect(nthElement(&a, 1) == null);
    try std.testing.expect(nthElement(&b, 1) == 3);

    try stdout.print("All tests passed\n", .{});
}
