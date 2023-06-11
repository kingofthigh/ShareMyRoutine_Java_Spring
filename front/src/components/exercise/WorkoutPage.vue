<template>
  <div>
    <b-row>
      <b-col md="auto">
        <b-calendar v-model="value" @context="onContext" locale="kor"></b-calendar>
      </b-col>
    </b-row>
    <workpage-form></workpage-form>
  </div>
</template>

<script>
import { mapState } from "vuex";
import workpageForm from "@/components/workout/include/workpageForm.vue";
export default {
  components: {
    workpageForm,
  },
  data() {
    return {
      value: "",
      context: null,
    };
  },
  computed: {
    ...mapState(["user"]),
  },
  created() {
    this.$store.dispatch("getUserWorkPage", this.user.user_id);
  },
  methods: {
    onContext(ctx) {
      console.log(this.value);
      this.context = ctx;
    },
  },
};
</script>
