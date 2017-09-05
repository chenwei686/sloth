package ${packageName}.aop;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import javax.annotation.Generated;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Generated(
    value = {
        "https://github.com/coolcooldee/sloth",
        "sloth version:1.0"
    },
    comments = "This class is generated by sloth"
)
@Aspect
@Order(1)
@Component
public class LogAspect {

    private static Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Pointcut("execution(* ${packageName}.controller.*Controller.* (..)) || execution(* ${packageName}.controller.restfulapi.*Controller.* (..)) || execution(* ${packageName}.controller.webpage.*Controller.* (..))")
    private void allMethod() {
    }


    @Around(value = "allMethod()")
    public Object aroundController(ProceedingJoinPoint joinPoint) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        logger.info("Client:"+request.getRemoteHost()+" Url:"+request.getRequestURL()+" Parameter:"+ JSON.toJSONString(request.getParameterMap()));
        Object result = joinPoint.proceed();
        logger.info("Server:"+request.getRemoteHost()+", Url:"+request.getRequestURL()+", Reponse:"+ JSONObject.toJSONString(result));
        return result;
    }


}
