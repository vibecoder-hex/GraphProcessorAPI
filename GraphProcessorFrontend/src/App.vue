<template>
    <nav class="navbar" role="navigation">
        <RouterLink class="navbar-item is-size-3" to="/">GraphProcessor</RouterLink>
        <RouterLink class="navbar-item" to="/about">About</RouterLink>
    </nav>
    <main>
        <RouterView/>
    </main>
</template>

<script setup lang="ts">

</script>


<style scoped>
  nav a {
      margin: 10px;
  }

</style>
