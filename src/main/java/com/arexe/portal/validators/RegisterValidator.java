package com.arexe.portal.validators;

import com.arexe.portal.entity.User;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class RegisterValidator implements Validator {


    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        boolean isEmailCorrect = PatternChecker.check(ValidPatterns.EMAIL, user.getEmail());
        if (!isEmailCorrect) {
            errors.rejectValue("email", "error.userEmailIsNotMatch");
        }

        boolean isPasswordCorrect = PatternChecker.check(ValidPatterns.PASSWORD, user.getPassword());
        if (!isPasswordCorrect) {
            errors.rejectValue("password", "error.userPasswordIsNotMatch");
        }
    }
}
