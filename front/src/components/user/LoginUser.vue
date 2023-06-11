<template>
  <div style="margin: 0 auto;">
    <login-form type="login"></login-form>
  </div>
</template>

<script>
import LoginForm from "@/components/user/include/LoginForm.vue";

export default {
  name: "UserLogin",
  components: {
    LoginForm,
  },
};
</script>

<style></style>
