import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OutputTorneiIscrittiComponent } from './output-tornei-iscritti.component';

describe('OutputTorneiIscrittiComponent', () => {
  let component: OutputTorneiIscrittiComponent;
  let fixture: ComponentFixture<OutputTorneiIscrittiComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OutputTorneiIscrittiComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OutputTorneiIscrittiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
