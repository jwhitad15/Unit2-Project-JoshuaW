package services.implementations;

import com.foths.application.exceptions.ItemExistsException;
import com.foths.application.models.UserProfile;
import com.foths.application.models.dto.UserProfileDTO;
import com.foths.application.repositories.UserProfileRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import services.UserProfileService;

@Service
@RequiredArgsConstructor
public class UserProfileServiceImplementation implements UserProfileService {

    private final UserProfileRepository userProfileRepository;
    private final ModelMapper modelMapper;

    private final PasswordEncoder encoder;

    @Override
    public UserProfileDTO createUserProfile(UserProfileDTO userProfileDTO) {
        if (userProfileRepository.existsByEmail(userProfileDTO.getEmail())) {
        throw new ItemExistsException(("Error: This profile already exists."));
        }
        userProfileDTO.setPassword(encoder.encode(userProfileDTO.getPassword()));
        UserProfile userProfile = mapToProfileEntity(userProfileDTO);
        userProfile = userProfileRepository.save(userProfile);
        return mapToProfileDTO(userProfile);
    }

    private UserProfileDTO mapToProfileDTO(UserProfile profileEntity) {
        return modelMapper.map(profileEntity, UserProfileDTO.class);
    }

    private UserProfile mapToProfileEntity(UserProfileDTO userProfileDTO) {
        return modelMapper.map(userProfileDTO, UserProfile.class);
    }
}
