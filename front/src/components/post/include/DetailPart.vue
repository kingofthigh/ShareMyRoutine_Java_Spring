<template>
  <div class="border" v-if="DetailPost">
    <h3>작성자</h3>
    <div>{{ DetailPost.user_id }}</div><hr>
    <h3>content</h3>
    <div>{{ DetailPost.post_content }}</div><hr>
    <div v-if="sets">
    <set-part class="set-zone" v-for="(set, index) in sets " :key='index'
        :exercise="set.exercise_id"
        :weight="set.weight"
        :reps="set.reps"
    >

    </set-part>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import setPart from "@/components/post/include/setPart.vue"

export default {
    name: "DetailPart",
    components: {
        setPart,
    },
    computed: {
        ...mapState(["DetailPost", "sets"]),
    },
    created() {
        console.log(this.DetailPost.workpage_id);
        // this.$store.dispatch("getSets", this.DetailPost.workpage_id);
    }
}
</script>

<style scoped>
.border {
    width: 320px;
    padding: 30px;
    border: solid 2px gray;
    margin: 70px auto;
}
.set-zone {
    width: 290px;
  min-height: 50px;
  padding: 15px;
  background-color:azure;
}
</style>