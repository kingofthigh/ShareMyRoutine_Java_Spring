<template>
    <div class="oneSet">
        <span>{{exercises[exercise-1].exercise_name}}</span>
        <span>{{weight}} KG</span>
        <span>{{reps}} REPs</span>
    </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
    name: "setPart",
    props: {
        exercise:Number,
        weight:Number,
        reps:Number,
    },
    computed: {
        ...mapState(["exercises"])
    }
}
</script>

<style scoped>
.oneSet {
    display: flex;
    flex-direction: row;
    width: 250px;
    justify-content: space-between;
}
</style>