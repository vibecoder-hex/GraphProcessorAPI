<template>
    <input type="file" accept=".json" @change="getJsonDataFromFile($event)" required><br>
</template>

<script setup>
  
  import { defineModel } from 'vue'
  const JSONStringModel = defineModel('distanceJSONString')
  
  function getJsonDataFromFile(event) {
      const file = event.target.files[0]
      const reader = new FileReader()
      reader.readAsText(file)
      reader.onload = () => {
          JSONStringModel.value = reader.result;
      }
  }
</script>

<style scoped></style>