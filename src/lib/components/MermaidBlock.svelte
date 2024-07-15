<script lang="ts">
	import { afterUpdate,onMount } from "svelte";
	import CopyToClipBoardBtn from "./CopyToClipBoardBtn.svelte";
	import mermaid from "mermaid";
	// biome-ignore lint/style/useConst: <explanation>
	export let code = `
graph LR
A --- B
B-->C[fa:fa-ban forbidden]
B-->D(fa:fa-spinner)`;
	// biome-ignore lint/style/useConst: <explanation>
	export let isFinshed = false;


mermaid.initialize({ 
		theme: 'neutral', 
		startOnLoad: false 
	});

	onMount(() => {
		console.log("mermaid block onMount");
		
	}); 
	afterUpdate(async () => {
		console.log("mermaid block update");
		if(isFinshed){
			mermaid.run();
		}
	});
</script>

<div class="group relative my-4 rounded-lg">
	<!-- eslint-disable svelte/no-at-html-tags -->
	<pre class="mermaid">
		{code}
	</pre>
	<CopyToClipBoardBtn
		classNames="absolute top-2 right-2 invisible opacity-0 group-hover:visible group-hover:opacity-100"
		value={code}
	/>
</div>
