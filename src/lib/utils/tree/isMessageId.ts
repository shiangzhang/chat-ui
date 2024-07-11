import type { Message } from "$lib/types/Message";

export function isMessageId(id: string): id is Message["id"] {
	console.log("isMessageId", id);
	return id.split("-").length === 5;
}
