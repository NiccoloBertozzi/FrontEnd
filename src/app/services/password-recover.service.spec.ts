import { TestBed } from '@angular/core/testing';

import { PasswordRecoverService } from './password-recover.service';

describe('PasswordRecoverService', () => {
  let service: PasswordRecoverService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PasswordRecoverService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
