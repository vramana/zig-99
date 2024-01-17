const std = @import("std");

const List = struct {
    value: u8,
    next: ?*List,
};

fn penultimate(list: *List) ?u8 {
    if (list.next == null) {
        return null;
    }

    if (list.next.?.next == null) {
        return list.value;
    }

    return penultimate(list.next.?);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var a = List{ .value = 3, .next = null };
    var b = List{ .value = 4, .next = &a };
    var c = List{ .value = 5, .next = &b };
    var d = List{ .value = 5, .next = &c };

    try std.testing.expect(penultimate(&a) == null);
    try std.testing.expect(penultimate(&b) == 4);
    try std.testing.expect(penultimate(&d) == 4);

    try stdout.print("All tests passed\n", .{});
}
