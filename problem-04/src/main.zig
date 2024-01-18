const std = @import("std");

const List = struct {
    value: u8,
    next: ?*List,
};

fn length(list: *List) usize {
    if (list.next == null) {
        return 1;
    }

    var l: usize = 0;
    var temp: ?*List = list;
    while (temp != null) {
        temp = temp.?.next;
        l = l + 1;
    }

    return l;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var a = List{ .value = 3, .next = null };
    var b = List{ .value = 4, .next = &a };
    var c = List{ .value = 4, .next = &b };
    var e = List{ .value = 4, .next = &c };

    try std.testing.expect(length(&a) == 1);
    try std.testing.expect(length(&b) == 2);
    try std.testing.expect(length(&c) == 3);
    try std.testing.expect(length(&e) == 4);

    try stdout.print("All tests passed!!\n", .{});
}
