package com.ssafit.base.controller.userController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import com.ssafit.base.model.dto.postDto.Post;
import com.ssafit.base.model.dto.workoutDto.Exercise;
import com.ssafit.base.model.dto.workoutDto.Set;
import com.ssafit.base.model.dto.workoutDto.WorkPage;
import com.ssafit.base.model.service.WorkOutService;


@RestController
@RequestMapping("/workout")
public class WorkOutController {

    private final WorkOutService workOutService;

    @Autowired
    public WorkOutController(WorkOutService workOutService) {
        this.workOutService = workOutService;
    }

    @PostMapping("/workoutPage")
    public ResponseEntity<Void> makeWorkOutPage(@RequestBody WorkPage workpage) {

        workOutService.makeWorkOutPage(workpage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }
    @GetMapping("/workoutPageList/{user_id}")
    public ResponseEntity<List<WorkPage>> getWorkPageList(@PathVariable String user_id) {

    	List<WorkPage> workpages = workOutService.selectWorkPage(user_id);
    	return new ResponseEntity<List<WorkPage>>(workpages, HttpStatus.OK);
    }

    @GetMapping("/exercises")
    public ResponseEntity<List<Exercise>> selectAllExercise() {
    	List<Exercise> exercises = workOutService.selectAllExercise();
        return new ResponseEntity<List<Exercise>>(exercises, HttpStatus.OK);
    }
    @GetMapping("/exercises/{part_id}")
    public ResponseEntity<List<Exercise>> selectPartExercise(@PathVariable int part_id) {
    	List<Exercise> exercises = workOutService.getExerciseByPart(part_id);
        return new ResponseEntity<List<Exercise>>(exercises, HttpStatus.OK);
    }

    @PostMapping("/set")
    public  ResponseEntity<Void> makeSet(@RequestBody Set set) {
        workOutService.makeSet(set);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    @GetMapping("/sets/{workpage_id}")
    public ResponseEntity<List<Set>> searchSet(@PathVariable int workpage_id) {
        List<Set> sets = workOutService.searchSet(workpage_id);
        return new ResponseEntity<List<Set>>(sets, HttpStatus.OK);
    }

    @PostMapping("/post")
    public ResponseEntity<Integer> makePost(@RequestBody Post post) {
        workOutService.makePost(post);
        return new ResponseEntity<Integer>(post.getPost_id(), HttpStatus.OK);
    }
    
    @GetMapping("/workpage/{workpage_id}")
    public ResponseEntity<WorkPage> getWorkPage(@PathVariable int workpage_id) {
    	System.out.println(workpage_id);
    	return new ResponseEntity<WorkPage>(workOutService.findWorkPage(workpage_id), HttpStatus.OK);
    }
}
