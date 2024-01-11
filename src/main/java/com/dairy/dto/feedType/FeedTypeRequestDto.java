package com.dairy.dto.feedType;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FeedTypeRequestDto {
	private Long id;
	@NotBlank(message = "feed type cannot be blank")
	private String type;


}
