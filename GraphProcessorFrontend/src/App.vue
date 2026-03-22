<template>
    <nav class="navbar" role="navigation">
        <RouterLink to="/">GraphProcessor</RouterLink>
        <RouterLink to="/about">About</RouterLink>
    </nav>
    <main>
        <RouterView />
    </main>
</template>

<script setup lang="ts">

</script>


<style scoped>
  nav a {
      margin: 10px;
  }

</style>
