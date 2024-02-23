<script>
    export let number
    export let live

    function increase() {
        live.pushEvent("set_number", {number: number + 1})
    }

    function decrease() {
        live.pushEvent("set_number", {number: number - 1})
    }
</script>

<h1 class="text-emPurple-light">Component from Svelte is working</h1>
<p class="text-white">The number is {number}</p>

<button on:click={increase} class="bg-red-500">increase 1</button>
<button on:click={decrease} class="bg-red-500">decrease 1</button>

<style>
   
</style>