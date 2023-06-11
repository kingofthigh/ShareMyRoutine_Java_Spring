<template>
  <div>
    <detail-part></detail-part>
  </div>
</template>

<script>
import DetailPart from "@/components/post/include/DetailPart.vue"

export default {
  name: "PostDetail",
  components: {
    DetailPart,
  },
  created() {
    console.log(this.$route.params.post_id)
    this.$store.dispatch("getPostDetail", this.$route.params.post_id);
  },
};
</script>

<style></style>
