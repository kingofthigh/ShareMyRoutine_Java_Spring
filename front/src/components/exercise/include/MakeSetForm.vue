<template>
    <div>
        <b-button class="show-btn" v-b-modal.modal-prevent-closing>운동 추가</b-button>
        <b-modal id="modal-prevent-closing" ref="modal" title="운동세트 기록" @show="resetModal" @hidden="resetModal"
            @ok="handleOk">
            <div class="btn-part">
                <b-button variant="primary" @click="changeCategory('전체')">전체</b-button>
                <b-button variant="primary" @click="changeCategory('가슴')">가슴</b-button>
                <b-button variant="primary" @click="changeCategory('등')">등</b-button>
                <b-button variant="primary" @click="changeCategory('어깨')">어깨</b-button>
                <b-button variant="primary" @click="changeCategory('하체')">하체</b-button>
            </div>
            <select class="ex-select" v-model="selectedExercise">
                <option v-for="exercise in selectedPart ? exercisesPart : exercises" :key="exercise.exercise_id"
                    :value="exercise.exercise_id">
                    {{ exercise.exercise_name }} | {{ part[exercise.part_id] }}
                </option>
            </select><br />
            <div class="inputWeight">
                <label for="weight"><b>무게 : </b>&nbsp;</label>
                <input type="text" placeholder="0" v-model="weight" />
            </div>
            <div class="inputReps">
                <label for="reps"><b>횟수 : </b>&nbsp;</label>
                <input type="text" placeholder="0" v-model="reps" />
            </div>
        </b-modal>
    </div>
</template>

<script>
import { mapState } from "vuex";
export default {
    name: "MakeSetForm",
    props: {
        selectedWorkout: {
            type: Object,
            required: true,
        },
    },
    data() {
        return {
            part: { 1: "가슴", 2: "등", 3: "하체", 4: "어깨" },
            part2: { 가슴: 1, 등: 2, 하체: 3, 어깨: 4 },
            selectedExercise: null,
            reps: 0,
            weight: 0,
            selectedPart: false,
        };
    },
    computed: {
        ...mapState(["exercises", "exercisesPart"]),
    },
    methods: {
        resetModal() {
            this.name = "";
            this.nameState = null;
        },
        handleOk(bvModalEvent) {
            bvModalEvent.preventDefault();
            this.handleSubmit();
        },
        handleSubmit() {
            if (
                this.selectedExercise == null ||
                this.selectedWorkout.workpage_id == null
            ) {
                alert("운동을 선택해주세요");
            } else {
                let newSet = {
                    sets_id: 0,
                    exercise_id: this.selectedExercise,
                    page_id: this.selectedWorkout.workpage_id,
                    weight: this.weight,
                    reps: this.reps,
                };
                this.$store.dispatch("registSet", newSet);
                this.$nextTick(() => {
                    this.$bvModal.hide("modal-prevent-closing");
                });
            }
        },
        changeCategory(slpart) {
            if (slpart == "전체") {
                this.selectedPart = false;
            } else {
                this.$store.dispatch("getExercisePart", this.part2[slpart]);
                this.selectedPart = true;
            }
            this.resetModal();
        },
    },
};
</script>

<style>
.btn-part {
    width: 350px;
    display: flex;
    justify-content: space-between;
    margin: 20px auto;
}

.ex-select {
    display: block;
    margin: 10px auto;
}

.inputWeight,
.inputReps {
    width: 270px;
    margin: 10px auto;
}
</style>
