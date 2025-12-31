<template>
    <nav class="navbar">
        <ul class="navbar-entries">
            <CircleUser class="lucide-icon navbar-entry" />
            <span class="navbar-entry">Home</span>
            <span class="navbar-entry">About</span>
        </ul>
    </nav>
</template>

<script setup lang="ts">
    import { CircleUser } from 'lucide-vue-next'
</script>

<style>
    .lucide-icon {
        padding: 0.5rem 0.5rem;
        margin: 0.5rem 0.5rem;
    }

    .navbar {
        background-color: darkgreen;
    }

    .navbar-entries {
        color: lightgreen;
        margin: 0;
        padding: 0;
        list-style: none;
        display: flex;
    }

    .navbar-entry {
        padding: 0.5rem 0.875rem;
        vertical-align: middle;
        margin: 0.5rem 0.125rem;
        height: 1.5rem;
        line-height: 1.5rem;
    }

    /* using sass here might be nice */
    .navbar-entry:hover {
        color: darkgreen;
        background-color: lightgreen;
    }

    .navbar-entry:active {
        color: darkgreen;
        background-color: white;
    }
</style>