<template>
    <div>{{ displayText }}</div>
</template>

<script setup lang="ts">

    import { ref } from 'vue'

    const displayText = ref<string>('');

    displayText.value = 'Hello World!'
</script>

<style>

</style>