<template>
    <div>
        <div></div>
    </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
    name: "Profile",
    computed: {
        ...mapState(["user"])
    }

}
</script>

<style>

</style>