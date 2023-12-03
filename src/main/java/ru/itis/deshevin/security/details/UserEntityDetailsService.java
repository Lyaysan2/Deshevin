package ru.itis.deshevin.security.details;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.itis.deshevin.repositories.UserEntityRepository;

import javax.security.auth.login.AccountNotFoundException;

@RequiredArgsConstructor
@Service
public class UserEntityDetailsService implements UserDetailsService {

    private final UserEntityRepository userEntityRepository;

    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return new UserEntityDetails(
                userEntityRepository.findByEmail(email).orElseThrow(AccountNotFoundException::new)
        );
    }
}
