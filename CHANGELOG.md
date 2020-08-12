# Changelog

# 0.5.0
### Added
- Adding exceptions class for MusicPlayceHttp
- Adding initial version of post repository
- Adding search repository

# 0.4.0+2
### Fixed
- Adding limit to userRepository.getAllUserPlaylists

# 0.4.0+1
### Changed
- Upgrading get_it version

# 0.4.0
### Added
- Adding user repository
- Adding playlists repository
- Fix response parsing

# 0.3.0+1
### Added
- Adding timeout to http client

## 0.3.0
### Added
- Adding notification repository

## 0.2.5
### Fixed
- Policy model cast from int to string

## 0.2.4
### Changed
- Adding lastResponse in http implementation

## 0.2.3
### Changed
- Adding validate token endpoint to RefreshTokenInterceptor blacklist

## 0.2.2
### Changed
- Adding Signup route to SetToken whitelist

## 0.2.1
### Changed
- Fixing nullable map in signup

## 0.2.0
### Added
- Adding more auth routes
- Adding response interceptors support
- Interceptor for setting token
- MusicPlayce own Request class
- MusicPlayce own send unstreamed responses method
- Comments for improve readability
- Http Layer improvements

### Changed
- Refresh Token interceptor fixes

## 0.1.0+1
### Added
- Initial version
- Add auth routes
