<template>
  <b-container fluid class="main-container">
    <b-row>
      <b-col md="5" class="main-left">
        <workpage-form></workpage-form>
        <b-list-group flush>
          <b-list-group-item
            v-for="(workout, index) in workoutList"
            :key="index"
            @click="selectWorkout(workout)"
            class="eachwork"
          >
            <b-row>
              <b-col md="4">{{ formatDate(workout.created_date) }}</b-col>
              <b-col md="6">{{ workout.memo }}</b-col>
              <b-col md="2" class="text-center">{{
                part[workout.part_id]
              }}</b-col>
            </b-row>
          </b-list-group-item>
        </b-list-group>
      </b-col>
      <b-col md="7" class="main-right">
        <div class="pageborder p-3 my-2">
          <h1>
            <b>운동 볼륨 : {{ totalVol }}</b>
          </h1>
          <h2 class="part2 text-center my-2">
            {{ part[selectedWorkout.part_id] }}
          </h2>
          <b-row class="align-items-center">
            <b-col md="10">{{ selectedWorkout.memo }}</b-col>
            <b-col md="2">
              <router-link style="text-decoration: none; font-weight: 600; color: yellow; font-size: 20px" :to="{name:'post-create', params:{workpage_id: selectedWorkout.workpage_id}}">
                게시물 등록
              </router-link>
            </b-col>
          </b-row>
          <make-set-form :selectedWorkout="selectedWorkout"></make-set-form>
        </div>
        <b-list-group flush class="set-container">
          <b-list-group-item
            v-for="set in sets"
            :key="set.sets_id"
            class="eachset"
          >
            <b-row>
              <b-col md="7">{{
                exercises[set.exercise_id - 1].exercise_name
              }}</b-col>
              <b-col md="2">{{ set.reps }} 회</b-col>
              <b-col md="3">{{ set.weight }}kg</b-col>
            </b-row>
          </b-list-group-item>
        </b-list-group>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import workpageForm from "@/components/exercise/include/workpageForm.vue";
import MakeSetForm from "./include/MakeSetForm.vue";
import { mapState } from "vuex";
import moment from "moment";

export default {
  name: "WorkOut",
  components: {
    workpageForm,
    MakeSetForm,
  },
  computed: {
    ...mapState(["user", "workoutList", "sets", "exercises", "workPage"]),
    totalVol() {
      if (this.sets.length === 0) {
        return 0;
      } else {
        return this.sets.reduce(
          (total, set) => total + set.reps * set.weight,
          0
        );
      }
    },
  },
  data() {
    return {
      part: { 1: "가슴", 2: "등", 3: "하체", 4: "어깨" },
      workpage: "",
      selectedWorkout: "",
    };
  },

  created() {
    this.selectedWorkout = this.workoutList[0];
    this.$store.dispatch("getExerciseList");
    this.$store.dispatch("getUserWorkPage", this.user.user_id);
    if (this.workoutList.length > 0) {
      this.workpage = this.workoutList[0].workpage_id;
      this.$store.dispatch("getSets", this.workpage);
    }
    this.$store.dispatch("getWorkPageById", this.workpage);
    this.$store.dispatch("getExerciseList");
  },

  methods: {
    formatDate(date) {
      return moment(date).format("YY/MM/DD HH:mm");
    },
    selectWorkout(workout) {
      console.log(workout.workpage_id);
      this.selectedWorkout = workout;
      this.$store.dispatch("getSets", this.selectedWorkout.workpage_id);
      console.log("셀렉티드 :" + this.selectedWorkout.workpage_id)
      this.$store.dispatch("getWorkPageById", this.selectedWorkout.workpage_id);
    },
  },
};
</script>

<style scoped>
.main-container {
  padding-top: 20px;
}

.eachwork {
  cursor: pointer;
  transition: 0.2s;
}

.eachwork:hover {
  background-color: #e9ecef;
}

.part2 {
  background-color: green;
  color: white;
  border-radius: 5px;
  padding: 5px;
}
</style>
