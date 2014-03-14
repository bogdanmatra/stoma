package my.app.stoma;

import my.app.stoma.domain.Answer;
import my.app.stoma.domain.Question;
import my.app.stoma.domain.User;
import my.app.stoma.domain.Role;
import my.app.stoma.service.AnswerService;
import my.app.stoma.service.QuestionService;
import my.app.stoma.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;


@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class UserServiceTest {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(UserServiceTest.class);

    @Autowired
    UserService userService;

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @Test
    public void testUserWithQuestionsAndAnswers() {

        LOGGER.info("Entering Test!");
        User user = new User();
        user.setFirstName("Gigi");
        user.setLastName("Ionescu");
        user.setUsername("bogdanmatra");
        user.setPassword("password");
        user.setEmail("bm@gmail.com");
        List<Role> roles = new ArrayList<Role>();
        Role role = new Role();
        role.setAuthority("ROLE_USER");
        roles.add(role);
        user.setRoles(roles);
        userService.save(user);


        Question question = new Question();
        question.setContent("Content Ques");
        List<Question> questionList = new ArrayList<Question>();
        questionList.add(question);
        question.setUser(user);
        Question savedQuestion = questionService.save(question);


        Answer answer = new Answer("Content Ans", question, user);
        List<Answer> answerList = new ArrayList<Answer>();
        answerList.add(answer);
        answer.setQuestion(question);
        answer.setUser(user);
        answer.setQuestion(question);
        answerService.save(answer);


        user.setAnswers(answerList);
        user.setQuestions(questionList);
        question.setAnswers(answerList);
        userService.save(user);


        User returnedUser = userService.findByUsername("bogdanmatra");

        //User test
        Assert.assertTrue(returnedUser.getUsername().equals("bogdanmatra"));
        Assert.assertTrue(returnedUser.getRoles().get(0).getAuthority().equals("ROLE_USER"));

        //Questions
        Assert.assertTrue(returnedUser.getQuestions().get(0).getContent().equals("Content Ques"));

        //Answers
        Assert.assertTrue(returnedUser.getAnswers().get(0).getContent().equals("Content Ans"));
        Assert.assertTrue(returnedUser.getQuestions().get(0).getAnswers().get(0).getContent().equals("Content Ans"));


        //Test answers for specific method
        List<Answer> answers = answerService.findByQuestionId(savedQuestion.getId());
        Assert.assertTrue(answers.get(0).getContent().equals("Content Ans"));


        LOGGER.info("Exiting Test!");


    }

}
