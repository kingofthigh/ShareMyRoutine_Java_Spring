package com.ssafit.base.util;

import java.io.UnsupportedEncodingException;

import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;

@Component
public class JwtUtil {
    private static final String SALT="SSAFIT"; 
    
    public String createToken(String claimId, String data) throws UnsupportedEncodingException {
        return Jwts.builder().setHeaderParam("alg", "HS256")
                .setHeaderParam("typ", "JWT")//헤더완료
                .claim(claimId, data)
                .signWith(SignatureAlgorithm.HS256, SALT.getBytes("UTF-8"))//서명 완료
                .compact();
    }
    
    public void valid(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException {
        Jwts.parser().setSigningKey("SSAFIT".getBytes("UTF-8")).parseClaimsJws(token);
    }

}
